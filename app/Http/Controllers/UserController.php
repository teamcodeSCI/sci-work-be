<?php

namespace App\Http\Controllers;

use App\Models\Position;
use App\Models\User;
use Exception;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator as FacadesValidator;

class UserController extends Controller
{

    public function login()
    {
        try {
            if (!Auth::attempt(['email' => request('email'), 'password' => request('password')])) {
                return response()->json(['status' => false, 'message' => 'Tài khoản hoặc mật khẩu không đúng'], 401);
            }
            /** @var \App\Models\User $user **/
            $user = Auth::user();
            $createToken = $user->createToken($user->email);
            $user['token'] = 'Bearer ' . $createToken->accessToken;

            $user['expiresAt'] = $createToken->token->expires_at;
            $user['position'] = Position::find($user['position_id']);
            $user['position'] = ['name' => $user['position']->name, 'code' => $user['position']->code];
            return response()->json(['status' => true, 'message' => 'Success', 'data' => $user], 200);
        } catch (Exception $e) {
            return response()->json([
                'status' => false,
                'message' => $e
            ], 500);
        }
    }
    public function register(Request $request)
    {
        try {
            $validator = FacadesValidator::make($request->all(), [
                'first_name' => 'required',
                'last_name' => 'required',
                'position_id' => 'required',
                'email' => 'required|email',
                'password' => 'required',
                'c_password' => 'required|same:password',
            ]);
            if ($validator->fails()) {
                return response()->json(['status' => false, 'message' => $validator->errors()], 400);
            }
            $input = $request->all();
            $position = Position::find($input['position_id']);
            if (!$position) {
                return response()->json([
                    'status' => false,
                    'message' => 'Position not found'
                ], 400);
            }
            $input['password'] = bcrypt($input['password']);
            $user = User::create($input);
            return response()->json(['status' => true, 'message' => 'Success', 'data' => $user], 200);
        } catch (Exception $e) {
            return response()->json([
                'status' => false,
                'message' => $e
            ], 500);
        }
    }
    public function resetPassword(Request $request)
    {
        try {
            $validator = FacadesValidator::make($request->all(), [
                'id' => 'required',
                'password' => 'required',
                'c_password' => 'required|same:password',
            ]);
            if ($validator->fails()) {
                return response()->json(['status' => false, 'error' => $validator->errors()], 401);
            }
            $input = $request->all();
            $user = User::find($input['id']);
            if (!$user) {
                return response()->json([
                    'status' => false,
                    'message' => 'User not found',
                ], 400);
            }
            $input['password'] = bcrypt($input['password']);
            $user->update($input);
            return response()->json([
                'status' => true,
                'message' => 'Success',
                'data' => $user
            ], 201);
        } catch (Exception $e) {
            return response()->json([
                'status' => false,
                'message' => $e
            ], 500);
        }
    }
    public function getUser()
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
            $user['position'] = Position::find($user['position_id']);
            $user['position'] = ['name' => $user['position']->name, 'code' => $user['position']->code];


            return response()->json([
                'status' => true,
                'message' => 'Success',
                'data' => $user
            ], 200);
        } catch (Exception $e) {
            return response()->json([
                'status' => false,
                'message' => $e
            ], 500);
        }
    }
}
