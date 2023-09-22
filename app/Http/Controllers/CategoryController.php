<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Item;
use App\Models\Topic;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;

class CategoryController extends Controller
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
            $input = $request->query();
            if (!array_key_exists('topic_id', $input)) {
                return response()->json([
                    'status' => false,
                    'message' => 'topic_id not found',
                ], 400);
            }
            $topic = Topic::find($input['topic_id']);
            if (!$topic) {
                return response()->json([
                    'status' => false,
                    'message' => 'Topic not found'
                ], 400);
            }
            $categories = Category::where('topic_id', '=', $topic['id'])->get();
            foreach ($categories as $key) {
                $key['items'] = Item::where('category_id', '=', $key['id'])->orderBy('index', 'asc')->get();
            }
            return response()->json([
                'status' => true,
                'message' => 'Success',
                'data' => $categories
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
        try {
            $userId = auth('api')->user()->id;
            $user = User::find($userId);
            if ($user === null || !$user) {
                return response()->json([
                    'status' => false,
                    'message' => 'User not found',
                ], 400);
            }
            $input = $request->all();
            $topic = Topic::find($input['topic_id']);
            if (!$topic) {
                return response()->json([
                    'status' => false,
                    'message' => 'Topic not found'
                ], 400);
            }

            $category = Category::create(['user_id' => $user['id'], 'topic_id' => $input['topic_id'], 'name' => $input['name']]);
            $category['items'] = Item::where('category_id', '=', $category['id'])->get();

            return response()->json([
                'status' => true,
                'message' => 'Success',
                'data' => $category
            ], 200);
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
        try {
            $input = $request->all();
            $category = Category::find($id);
            if (!$category) {
                return response()->json([
                    'status' => false,
                    'message' => 'Category not found'
                ], 400);
            }
            $category->update(['name' => $input['name']]);
            $category['items'] = Item::where('category_id', '=', $category['id'])->get();

            return response()->json([
                'status' => true,
                'message' => 'Success',
                'data' => $category
            ], 200);
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
        //
        try {

            $category = Category::find($id);
            if (!$category) {
                return response()->json([
                    'status' => false,
                    'message' => 'Category not found'
                ], 400);
            }
            $category->delete();

            return response()->json([
                'status' => true,
                'message' => 'Success',
                'data' => $category
            ], 200);
        } catch (Exception $e) {
            return response()->json([
                'status' => false,
                'message' => $e
            ], 500);
        }
    }
}
