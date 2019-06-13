import "bootstrap";


import { displayMatching } from "../plugins/display_matching";
import { displayRecommandation } from "../plugins/display_recommandation";
import { displayLikeCounter } from "../plugins/display_like_counter";
import { displayComment } from "../plugins/display_comment";
import { select2Home } from "../plugins/select2_home";
import { matchingStyle } from "../plugins/matching_style";
import { imageShow } from "../plugins/image_show";
//import { animateHome } from "../plugins/animate_home";

displayMatching();
displayRecommandation();
select2Home();
// displayLikeCounter();
displayComment();
matchingStyle();
imageShow();
//animateHome();
