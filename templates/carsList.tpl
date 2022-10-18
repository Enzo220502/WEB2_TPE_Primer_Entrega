{include file="header.tpl"}
<div>
    <a href="formAddCar" class="btn btn-primary btn-sm">Add vehicle</a>
</div>
<div class="table-responsive-sm">
    <table class="table-responsive table-sm align-middle">
            <thead class="table-light">
                    <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Engine</th>
                        <th scope="col">Type</th>
                        <th scope="col">Price</th>
                        <th scope="col">Color</th>
                        <th scope="col">Description</th>
                    </tr>
            <thead>
            <tbody>
                {foreach from=$cars item=$car}
                        <tr>
                            <td colspan="1">{$car->name}</td>
                            <td>{$car->type_engine}</td>
                            <td>{$car->type}</td>
                            <td>{$car->price|truncate:50}</td>
                            <td>{$car->color}</td>
                            <td>{$car->especifications|truncate:35}</td>
                            <td><a href = 'seeMore/{$car->ID}'class="btn btn-primary btn-sm">Show More</a></td>
                            {if $_SESSION['IS_LOGGED'] = true}<td><a href = 'deleteCar/{$car->ID}' class="btn btn-primary btn-sm">Delete</a></td>{/if}
                            {if $_SESSION['IS_LOGGED'] = true}<td><a href = 'formModify/{$car->ID}' class="btn btn-primary btn-sm">Edit</a></td>{/if}
                        </tr>
                {/foreach}
            </tbody>            
    </table>
</div>
{include file = "foother.tpl"} 



