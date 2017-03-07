{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{def $check_visibility = ezini( 'SiteAccessSettings', 'ShowHiddenNodes' )|ne( 'true' )
     $content = false()
     $has_readable_related = false()}
{section var=Relations loop=$attribute.content.relation_list}
{if $Relations.item.in_trash|not()}
    {set $content = fetch( content, object, hash( object_id, $Relations.item.contentobject_id ) )}
    {if or( $content.can_read, $content.can_view_embed)}
        {if or(
            $check_visibility|not,
            fetch( content, node, hash( node_id, $Relations.item.node_id ) ).is_invisible|not
        )}
            {content_view_gui view=embed content_object=$content}<br />
            {set $has_readable_related = true()}
        {/if}
    {/if}
{/if}
{/section}
{if $has_readable_related|not()}
{'There are no related objects.'|i18n( 'design/standard/content/datatype' )}
{/if}
{undef $check_visibility $content $has_readable_related}