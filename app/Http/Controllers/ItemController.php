<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Item;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;

class ItemController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
            $input = $request->all();
            $userId = auth('api')->user()->id;
            $user = User::find($userId);
            if ($user === null || !$user) {
                return response()->json([
                    'status' => false,
                    'message' => 'User not found',
                ], 400);
            }
            $category = Category::find($input['category_id']);
            if (!$category) {
                return response()->json([
                    'status' => false,
                    'message' => 'Category not found'
                ], 400);
            }
            $items = Item::where('category_id', '=', $category['id'])->get();
            $item = Item::create([
                'category_id' => $category['id'],
                'user_id' => $user['id'],
                'index' => count($items),
                'title' => $input['title']
            ]);
            return response()->json([
                'status' => true,
                'message' => 'Success',
                'data' => $item
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
        $item = Item::find($id);
        if (!$item) {
            return response()->json([
                'status' => false,
                'message' => 'Item not found'
            ], 400);
        }
        if (array_key_exists('category_id', $input)) {
            $category = Category::find($input['category_id']);
            if (!$category) {
                return response()->json([
                    'status' => false,
                    'message' => 'Category not found'
                ], 400);
            }
        }
        $item->update($input);
        return response()->json([
            'status' => true,
            'message' => 'Success',
            'data' => $item
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
    }
}