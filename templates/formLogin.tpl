{include file ="header.tpl"}

<form class="row g-4" action ='validate' method="POST">
    <div class="col-auto">
        <input type="text" name = "username" palceholder="Username" class="form-control" id="inputPassword2" required>
    </div>
    <div class="col-auto">
        <label for="password" class="visually-hidden">Password</label>
        <input type="password" name = "password" placeholder = "Password" class="form-control"  required>
    </div>
    <div class="col-auto">
        <button type="submit" class="btn btn-primary mb-3">Login</button>
    </div>
    <div class="col-auto">
        <a class="btn btn-primary" href = "cars">Login as a guest</a>
    </div>
    {if $error} 
        <div class="alert alert-danger mt-3">
            {$error}
        </div>
    {/if}
</form>

{include file = "foother.tpl"}