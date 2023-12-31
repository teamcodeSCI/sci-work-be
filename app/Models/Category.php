<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;
    protected $table = 'categories';
    protected $primaryKey = 'id';
    protected $fillable = ['topic_id', 'user_id', 'name'];
    public function user()
    {
        return $this->belongsTo('Models\User', 'user_id', 'id');
    }
    public function topic()
    {
        return $this->hasMany('Models\Topic', 'id', 'topic_id');
    }
}
