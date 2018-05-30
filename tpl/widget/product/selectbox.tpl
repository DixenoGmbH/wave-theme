[{assign var="oSelections" value=$oSelectionList->getSelections()}]

[{if $oSelections}]
    <div class="form-group">
        [{if !$blHideLabel}]
            <p class="variant-label"><strong>[{$oSelectionList->getLabel()}][{oxmultilang ident="COLON"}]</strong></p>
        [{/if}]
        <div class="dropdown">
            <button type="button" class="btn btn-outline-dark dropdown-toggle" data-toggle="dropdown">
                [{assign var="oActiveSelection" value=$oSelectionList->getActiveSelection()}]
                [{if $oActiveSelection}]
                    <span class="float-left">[{$oActiveSelection->getName()}]</span>
                [{elseif !$blHideDefault}]
                    <span class="float-left">
                        [{if $sFieldName == "sel"}]
                            [{oxmultilang ident="PLEASE_CHOOSE"}]
                        [{else}]
                            [{$oSelectionList->getLabel()}] [{oxmultilang ident="CHOOSE_VARIANT"}]
                        [{/if}]
                    </span>
                [{/if}]
            </button>
            [{if $editable !== false}]
                <input type="hidden" name="[{$sFieldName|default:"varselid"}][[{$iKey}]]" value="[{if $oActiveSelection}][{$oActiveSelection->getValue()}][{/if}]">
                <ul class="dropdown-menu [{$sJsAction}][{if $sFieldName != "sel"}] vardrop[{/if}]" role="menu">
                    [{if $oActiveSelection && !$blHideDefault}]
                        <li>
                            <a href="#" rel="">
                                [{if $sFieldName == "sel"}]
                                    [{oxmultilang ident="PLEASE_CHOOSE"}]
                                [{else}]
                                    [{oxmultilang ident="CHOOSE_VARIANT"}]
                                [{/if}]
                            </a>
                        </li>
                    [{/if}]
                    [{foreach from=$oSelections item=oSelection}]
                        <li class="[{if $oSelection->isDisabled()}]disabled js-disabled[{/if}]">
                            <a href="[{$oSelection->getLink()}]" data-selection-id="[{$oSelection->getValue()}]" class="[{if $oSelection->isActive()}]active[{/if}]">[{$oSelection->getName()}]</a>
                        </li>
                    [{/foreach}]
                </ul>
            [{/if}]
        </div>
    </div>
[{/if}]