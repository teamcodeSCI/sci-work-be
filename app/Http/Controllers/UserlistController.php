<?php

namespace App\Http\Controllers;

use App\Models\Topic;
use App\Models\User;
use App\Models\UserList;
use Exception;
use Illuminate\Http\Request;

class UserlistController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //
        try {
            $query = $request->query();
            if (!array_key_exists('topic_id', $query)) {
                return response()->json([
                    'status' => false,
                    'message' => 'topic_id not found',
                ], 400);
            }
            $topic = Topic::find($query['topic_id']);
            if (!$topic) {
                return response()->json([
                    'status' => false,
                    'message' => 'Topic not found',
                ], 400);
            }

            $userList = UserList::select('user_id')->where('topic_id', $topic->id)->get();
            $userArrs = [];
            foreach ($userList as $key) {
                $user = User::select('id', 'first_name', 'last_name', 'background', 'email', 'position_id')->find($key['user_id']);
                $position = $user->position;
                $user['position_code'] = $position->code;
                $user['position_name'] = $position->name;
                unset($user['position']);
                unset($user['position_id']);
                array_push($userArrs, $user);
            }

            return response()->json([
                'status' => true,
                'message' => 'Success',
                'data' => ['topic_id' => $topic->id, "userList" => $userArrs]
            ], 200);
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
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
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
