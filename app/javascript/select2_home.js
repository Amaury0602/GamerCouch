// import $ from 'jquery';
import 'select2';
import 'select2/dist/css/select2.css';

const select2Home = () => {
  console.log($('.select2'));
  $('.select2').select2();
  console.log('hello');
};

export { select2Home };
