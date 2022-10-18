{include file = "header.tpl"}
    <label>Form to {$action} Car</label>
         <form action="{$action}" method="POST">
            <label>Name of the Vehicle:</label>
                <input type="text" name = "nameVehicle" placeholder="Name of the Vehicle" {if $action==modify}value = "{$car->name}"{/if} required>
            <label>Type of Engine:</label>
                <input type="text" name = "typeEngine"  placeholder="Engine"{if $action==modify}value = "{$car->type_engine}"{/if} required>
            <label>Select type of Vehicle:</label>
                <select name="typeVehicle" class="form-control form-select-sm" aria-label=".form-select-sm example">
                {foreach from=$categories item = $engine}
                <option {if ($action == modify)&&($car->id_type_vehicle == $engine->ID)}selected{/if} value="{$engine->ID}">{$engine->type}</option>
                {/foreach}
                </select>
            <label>Price:</label>
                <input type="text" name = "priceVehicle"  placeholder="Price" {if $action==modify}value = "{$car->price}"{/if} required>
            <label>Color:</label>
                <input type="text" name = "colorVehicle"  placeholder="Color" {if $action==modify}value = "{$car->color}"{/if} required>    
            <label>Add a description of the vehicle:</label>
                <input type="text" name = "descVehicle"  placeholder="Description" {if $action==modify}value = "{$car->especifications}"{/if}required>
            <label>Image of the vehicle to be added:</label>
                <input type="file" name = "imgVehicle"  placeholder="Photo of Vehicle">
                {if $action == modify}<input type="hidden" name = "ID"  value="{$car->ID}">{/if}
            <button type="submit">{if $action=="modify"}Save{else}Add Car{/if}</button>
        </form>
{include file = "foother.tpl"}