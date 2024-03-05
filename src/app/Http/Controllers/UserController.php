<?php
namespace App\Http\Controllers;
use App\Models\User;
use Inertia\Inertia;

class UserController extends Controller
{
    public function index()
    {
        return Inertia::render('User/Index', [
            'users' => User::all()->map(function ($user) {
                return [
                    'id' => $user->id,
                    'name' => $user->name,
                    'email' => $user->email,
                    'edit_url' => route('users.edit', $user),
                ];
            }),
            'create_url' => route('users.create'),
        ]);
    }

    public function show()
    {
        $user = User::all();

        return Inertia::render('User/Show', [
            'users' => $user
        ]);
    }

    public function store(Request $request)
    {
        User::create(
            $request->validate([
                'name' => ['required', 'max:50'],
                'email' => ['required', 'max:50', 'email'],
            ])
        );

        return to_route('users.index');
    }
}
