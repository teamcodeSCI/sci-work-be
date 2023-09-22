<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Item extends Model
{
    use HasFactory;
    protected $table = 'items';
    protected $primaryKey = 'id';
    protected $fillable = ['category_id', 'user_id', 'content', 'index'];
    public function user()
    {
        return $this->belongsTo('Models\User', 'user_id', 'id');
    }
    public function category()
    {
        return $this->hasMany('Models\Category', 'id', 'category_id');
    }
}
