<h1>{$page->title}</h1>

<p>
<a href="{$smarty.const.WWW_TOP}/upcoming/1">Box Office</a> | 
<a href="{$smarty.const.WWW_TOP}/upcoming/2">In Theatre</a> | 
<a href="{$smarty.const.WWW_TOP}/upcoming/3">Opening</a> | 
<a href="{$smarty.const.WWW_TOP}/upcoming/4">Upcoming</a> | 
<a href="{$smarty.const.WWW_TOP}/upcoming/5">DVD Releases</a>
</p>

{$site->adbrowse}	

{if $data|@count > 0}

<table style="width:100%;" class="data highlight icons" id="coverstable">
		<tr>
			<th></th>
			<th>Name</th>
		</tr>

		{foreach $data as $result}
		<tr class="{cycle values=",alt"}">
			<td class="mid">
				<div class="movcover">
					<img class="shadow" src="{$result->posters->profile}" width="120" border="0" alt="{$result->title|escape:"htmlall"}" />
					<div class="movextra">
						<a class="rndbtn" target="_blank" href="{$site->dereferrer_link}{$result->links->alternate}" title="View Rotten Tomatoes Details">Rotten Tomatoes</a>
						<a class="rndbtn" target="_blank" href="{$site->dereferrer_link}http://www.imdb.com/title/tt{$result->alternate_ids->imdb}" title="View Imdb Details">Imdb</a>				
					</div>
				</div>
			</td>
			<td colspan="3" class="left">
				<h2><a href="{$smarty.const.WWW_TOP}/movies?imdb={$result->alternate_ids->imdb}">{$result->title|escape:"htmlall"}</a> (<a class="title" title="{$result->year}" href="{$smarty.const.WWW_TOP}/movies?year={$result->year}">{$result->year}</a>) {if $result->ratings->critics_score > 0}{$result->ratings->critics_score}/100{/if}</h2>
				{if $result->synopsis == ""}No synopsis. Check <a target="_blank" href="{$site->dereferrer_link}{$result->links->alternate}" title="View Rotten Tomatoes Details">Rotten Tomatoes</a> for more information.{else}{$result->synopsis}{/if}
				{if $result->abridged_cast|@count > 0}
					<br /><br />
					<b>Starring:</b> 
					{foreach from=$result->abridged_cast item=cast name=cast}
						<a href="{$smarty.const.WWW_TOP}/movies?actors={$cast->name|escape:"htmlall"}" title="Search for movies starring {$cast->name|escape:"htmlall"}">{$cast->name|escape:"htmlall"}</a>
						{if $smarty.foreach.cast.last}<br/><br/>{else},{/if}						
					{/foreach}
				{else}
					<br/><br/>
				{/if}

				{if $ourmovies[$result->alternate_ids->imdb] != ""}
					<a class="rndbtn" href="{$smarty.const.WWW_TOP}/movies?imdb={$result->alternate_ids->imdb}">Download</a>
				{/if}
                <a style="display:{if $userimdbs[$result->alternate_ids->imdb] == ""}inline{else}none;{/if}" onclick="mymovie_add('{$result->alternate_ids->imdb}', this);return false;" class="rndbtn" href="#">Add To My Movies</a>
				<a style="display:{if $userimdbs[$result->alternate_ids->imdb] != ""}inline{else}none;{/if}" onclick="mymovie_del('{$result->alternate_ids->imdb}', this);return false;" href="#" class="rndbtn">Remove From My Movies</a>


			</td>
		</tr>
		{/foreach}
</table>

{else}
<h2>No results</h2>
{/if}
