<li class="menu_useful"> 
	<h2>Useful Links</h2> 
	<ul>
	{if $loggedin=="true"}
	<li class="mmenu"><a title="{$site->title} Rss Feeds" href="{$smarty.const.WWW_TOP}/rss">Rss Feeds</a></li>
	<li class="mmenu"><a title="{$site->title} Api" href="{$smarty.const.WWW_TOP}/apihelp">Api</a></li>
	{/if}
	{foreach from=$usefulcontentlist item=content}
		<li class="mmenu{if $menu.newwindow =="1"}_new{/if}"><a {if $menu.newwindow =="1"}class="external" target="null"{/if} title="{$content.title}" href="{$smarty.const.WWW_TOP}/content/{$content.id}{$content.url}">{$content.title}</a></li>
	{/foreach}
	</ul>
</li>
