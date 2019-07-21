import "bootstrap";


import { displayMatching } from "../plugins/display_matching";
import { displayRecommandation } from "../plugins/display_recommandation";
import { displayLikeCounter } from "../plugins/display_like_counter";
import { displayComment } from "../plugins/display_comment";
import { select2Home } from "../plugins/select2_home";
import { imageShow } from "../plugins/image_show";
import { searchApi } from "../plugins/search_api";
// import { matchingStyle } from "../plugins/matching_style";
//import { animateHome } from "../plugins/animate_home";


searchApi();
displayMatching();
displayRecommandation();
select2Home();
displayComment();
imageShow();
// displayLikeCounter();
// matchingStyle();
