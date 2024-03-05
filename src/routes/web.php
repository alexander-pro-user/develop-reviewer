<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', [\App\Http\Controllers\PostController::class, 'index'])->name('post.index');


//Route::get('/', function () {
    //return view('welcome');
//});

Route::group(['prefix' => 'user'], function ()
{
    Route::get('/show', [\App\Http\Controllers\UserController::class, 'show'])->name('user.show');
});
