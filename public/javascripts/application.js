// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function getPcbInputs() {
  $$("input.position_text_box").each(function (position) {
    $("sort_form").innerHTML += "<input style=\"display:none;visibility:hidden;\" value=\""+position.value+"\" name=\""+position.name+"\"/>";
  });
}