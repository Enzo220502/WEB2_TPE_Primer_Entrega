

<form action="modify" method="POST">
    <label>Form to Edit car:</label>
    <label>Name of the Vehicle:</label>
    <input type="text" name = "nameEdit" placeholder="Name of the Vehicle" value = "{$car->name}">
    <label>Type of Engine:</label>
    <input type="text" name = "typeEngineEdit"  placeholder="Engine" value = "{$car->type_engine}">
    <label>Select type of Vehicle:</label>
    <select name="typeVehicleEdit" class="form-control">
        {foreach from=$categories item = $engine}
            <option value="{$engine->ID}">{$engine->type}</option>
        {/foreach}
    </select>
    <label>Price:</label>
    <input type="text" name = "priceVehicleEdit"  placeholder="Price" value = "{$car->price}">
    <label>Color:</label>
    <input type="text" name = "colorVehicleEdit"  placeholder="Color" value = "{$car->color}">    
    <label>Add a description of the vehicle:</label>
    <input type="text" name = "descVehicleEdit"  placeholder="Description" value = "{$car->especifications}">
    <label>Image of the vehicle to be Modified:</label>
    <input type="file" name = "imgVehicleEdit"  placeholder="Photo of Vehicle">
    <button type="submit">Guardar</button>
</form>

