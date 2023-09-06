<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Topic extends Model
{
    use HasFactory;
    protected $table = 'topics';
    protected $primaryKey = 'id';
    protected $fillable = ['userList_id', 'user_id', 'name'];
    public function user()
    {
        return $this->belongsTo('Models\User', 'user_id', 'id');
    }
}
