<?php

use App\Http\Controllers\PositionController;
use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
Route::prefix('position')->group(function () {
    Route::get('/', [PositionController::class, 'index']);
    Route::post('/create', [PositionController::class, 'store']);
    Route::delete('/{position}', [PositionController::class, 'destroy']);
});
Route::prefix('auth')->group(function () {
    Route::post('/login', [UserController::class, 'login']);
    Route::post('/register', [UserController::class, 'register']);
    Route::post('/reset-password', [UserController::class, 'resetPassword']);
    Route::get('/get-user', [UserController::class, 'getUser']);
});
