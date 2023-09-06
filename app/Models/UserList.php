<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserList extends Model
{
    use HasFactory;
    protected $table = 'userlists';
    protected $primaryKey = 'id';
    protected $fillable = ['user_id', 'topic_id'];
    public function user()
    {
        return $this->hasMany('Models\User', 'id', 'user_id');
    }
    public function topic()
    {
        return $this->hasMany('Models\Topic', 'id', 'topic_id');
    }
}
