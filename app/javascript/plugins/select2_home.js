// import $ from 'jquery';
import 'select2';
// import 'select2/dist/css/select2.css';

const select2Home = () => {
  // ($('.select2'));
  $('.select2').select2({
    placeholder: "Enter your games"
  });

};

export { select2Home };
