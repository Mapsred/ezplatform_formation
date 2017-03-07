{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{let class_list=fetch( class, list )}
<div id="package" class="create">
    <div id="sid-{$current_step.id|wash}" class="pc-{$creator.id|wash}">

    <form enctype="multipart/form-data" method="post" action={'package/create'|ezurl}>

    {include uri="design:package/create/error.tpl"}

    {include uri="design:package/header.tpl"}
    <div class="block">
    <p>{'Please select the site CSS file to be included in the package.'|i18n('design/admin/package')}</p>

    <input type="hidden" name="MAX_FILE_SIZE" value="32000000" />
    <input class="box" name="PackageSiteCSSFile" type="file" />
    </div>

    <div class="block">
    <p>{'Please select the classes CSS file to be included in the package.'|i18n('design/admin/package')}</p>

    <input type="hidden" name="MAX_FILE_SIZE" value="32000000" />
    <input class="box" name="PackageClassesCSSFile" type="file" />
    </div>

    {include uri="design:package/navigator.tpl"}

    </form>

    </div>
</div>
{/let}
