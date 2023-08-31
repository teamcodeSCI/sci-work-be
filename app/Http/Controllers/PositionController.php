<?php

namespace App\Http\Controllers;

use App\Models\Position;
use Exception;
use Illuminate\Http\Request;

class PositionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        try {
            $position = Position::select('id', 'code', 'name')->get();
            return response()->json([
                'status' => true,
                'message' => 'Success',
                'data' => $position
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
            $input = $request->all();
            $getPositionByCode = Position::where('code', '=', $input['code'])->get();
            $getPositionByName = Position::where('name', '=', $input['name'])->get();

            if (count($getPositionByCode) !== 0 || count($getPositionByName) !== 0) {
                return response()->json([
                    'status' => false,
                    'message' => 'Position code or name already exists',
                ], 400);
            }
            $position = Position::create($input);
            return response()->json([
                'status' => true,
                'message' => 'Success',
                'data' => $position
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
        try {
            $position = Position::find($id);
            if ($position === null) {
                return response()->json([
                    'status' => false,
                    'message' => 'Position not found'
                ], 400);
            }
            $position->delete();
            return response()->json([
                'status' => true,
                'message' => 'Success',
                'data' => $position
            ], 200);
        } catch (Exception $e) {
            return response()->json([
                'status' => false,
                'message' => $e
            ], 500);
        }
    }
}
