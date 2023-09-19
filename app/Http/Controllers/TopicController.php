<?php

namespace App\Http\Controllers;

use App\Models\Topic;
use App\Models\User;
use App\Models\UserList;
use Exception;
use Illuminate\Http\Request;

class TopicController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        try {

            $userId = auth('api')->user()->id;
            $user = User::find($userId);
            if ($user === null || !$user) {
                return response()->json([
                    'status' => false,
                    'message' => 'User not found',
                ], 400);
            }

            $topics = UserList::select('topic_id', 'user_id')->where('user_id', '=', $user->id)->get();
            $topicArr = [];
            foreach ($topics as $key) {
                $key['topic'] = Topic::find($key['topic_id']);
                $key['topic']->owner = User::select('first_name', 'last_name', 'email')->find($key['topic']->user_id);
                array_push($topicArr, $key['topic']);
            }

            return response()->json([
                'status' => true,
                'message' => 'Success',
                'data' =>  $topicArr
            ], 201);
        } catch (Exception $e) {
            return response()->json([
                'status' => false,
                'message' => $e
            ], 500);
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try {
            $input = $request->all();
            $userId = auth('api')->user()->id;
            $user = User::find($userId);
            if ($user === null || !$user) {
                return response()->json([
                    'status' => false,
                    'message' => 'User not found',
                ], 400);
            }
            $input['user_id'] = $user->id;
            $topic = Topic::create($input);
            UserList::create(['user_id' => $input['user_id'], 'topic_id' => $topic->id]);
            $topic['owner'] = ["first_name" => $user->first_name, "last_name" => $user->last_name, "email" => $user->email];
            return response()->json([
                'status' => true,
                'message' => 'Success',
                'data' => $topic
            ], 201);
        } catch (Exception $e) {
            return response()->json([
                'status' => false,
                'message' => $e
            ], 500);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {

        try {
            $topic = Topic::select('id', 'user_id', 'name')->find($id);
            if (!$topic) {
                return response()->json([
                    'status' => false,
                    'message' => 'Topic not found'
                ], 400);
            }
            $topic['userList'] = UserList::select('user_id')->where('topic_id', '=', $topic['id'])->get();
            $userArrs = [];
            foreach ($topic['userList'] as $key) {
                $user = User::select('id', 'first_name', 'last_name', 'background', 'email', 'position_id')->find($key['user_id']);
                $position = $user->position;
                $user['position_code'] = $position->code;
                $user['position_name'] = $position->name;
                unset($user['position']);
                unset($user['position_id']);
                array_push($userArrs, $user);
            }
            $topic['userList'] = $userArrs;
            return response()->json([
                'status' => true,
                'message' => 'Success',
                'data' => $topic
            ], 201);
        } catch (Exception $e) {
            return response()->json([
                'status' => false,
                'message' => $e
            ], 500);
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        try {
            $input = $request->all();
            $userId = auth('api')->user()->id;
            $user = User::find($userId);
            if ($user === null || !$user) {
                return response()->json([
                    'status' => false,
                    'message' => 'User not found',
                ], 400);
            }
            $topic = Topic::find($id);
            if (!$topic) {
                return response()->json([
                    'status' => false,
                    'message' => 'Topic not found',
                ], 400);
            }

            $topic->update(['name' => $input['name']]);
            $topic['owner'] = ["first_name" => $user->first_name, "last_name" => $user->last_name, "email" => $user->email];
            return response()->json([
                'status' => true,
                'message' => 'Success',
                'data' => $topic
            ], 201);
        } catch (Exception $e) {
            return response()->json([
                'status' => false,
                'message' => $e
            ], 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {
            $userId = auth('api')->user()->id;
            $user = User::find($userId);
            if ($user === null || !$user) {
                return response()->json([
                    'status' => false,
                    'message' => 'User not found',
                ], 400);
            }
            $topic = Topic::find($id);
            if (!$topic) {
                return response()->json([
                    'status' => false,
                    'message' => 'Topic not found'
                ], 400);
            }
            if ($user['id'] !== $topic['user_id']) {
                return response()->json([
                    'status' => false,
                    'message' => 'You are not owner of topic'
                ], 400);
            }
            UserList::where('topic_id', '=', $topic['id'])->delete();
            $topic->delete();
            return response()->json([
                'status' => true,
                'message' => 'Success',
                'data' => $topic
            ], 201);
        } catch (Exception $e) {
            return response()->json([
                'status' => false,
                'message' => $e
            ], 500);
        }
    }
}
