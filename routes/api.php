<?php

use App\Http\Controllers\PositionController;
use App\Http\Controllers\TopicController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\UserlistController;
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


Route::get('/unauthorized', function () {
    return response()->json([
        'status' => false,
        'message' => 'Unauthorized'
    ], 401);
})->name('unauthorized');
Route::prefix('position')->group(function () {
    Route::get('/', [PositionController::class, 'index']);
    Route::post('/create', [PositionController::class, 'store']);
    Route::delete('/{position}', [PositionController::class, 'destroy']);
});
Route::prefix('auth')->group(function () {
    Route::post('/login', [UserController::class, 'login']);
    Route::post('/register', [UserController::class, 'register']);
});
Route::middleware(['auth:api'])->group(function () {
    Route::post('/auth/reset-password', [UserController::class, 'resetPassword']);
    Route::get('/auth/get-user', [UserController::class, 'getUser']);
    Route::put('/auth/update-user', [UserController::class, 'updateUser']);
    Route::prefix('topic')->group(function () {
        Route::get('/', [TopicController::class, 'index']);
        Route::post('/create', [TopicController::class, 'store']);
        Route::get('/{topic}', [TopicController::class, 'show']);
        Route::put('/{topic}', [TopicController::class, 'update']);
        Route::delete('/{topic}', [TopicController::class, 'destroy']);
    });
    Route::prefix('user-list')->group(function () {
        Route::get('/', [UserlistController::class, 'index']);
        Route::post('/create', [UserlistController::class, 'store']);
    });
});
