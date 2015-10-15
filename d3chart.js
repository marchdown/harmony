// General entoogdoon fractions
var ratios = [2,243/128.0,12/7,15/8,1.1666666666666667,3/2.0,4/3.0,5/4.0,1.1428571428571428,1.125,1.1111111111111112,1.1,1.0909090909090908];
// for (i = 1; i < 12; i++) {
//     ratios.push(((i + 1) * 1.0) / (i * 1.0));
// }
//alert(ratios);
var power_of_two_over_threes = [1/3, 2/3, 4/3, 8/3, 16/3];


// Generate interval lengths in cents
var ratio_to_cents = function (r) {
    return res = Math.log(r) / Math.log(2) * 1200;
}

var just_intervals = [];

for (r in ratios) {

    just_intervals.push(ratio_to_cents(ratios[r]));
}
// alert(just_intervals);

var semitones = [];
for (i = 0; i < 24; i++) {
    semitones.push(i*100);
}
//alert(semitones);



var chart = c3.generate({
    data: {
        x: { 'semitones',
             tick: {
                 fit: true,
                 values: semitones //[1, 2, 4, 8, 16, 32, ...]                 
             }
           }
        // xs: {
        //     ratios: 'cents',
        //     just_intervals: 'cents'
        // }
        columns: [
            ['2^n/3'].concat(ratio_to_cents(power_of_two_over_threes)),
            ['ratios'].concat(ratios),
            ['just intervals'].concat(just_intervals.reverse()),
            ['semitones (Equal Divisions of Octave in twelve parts)'].concat(semitones)
            
            //['data1', 30, 200, 100, 400, 150, 250],
            //['data2', 50, 20, 10, 40, 15, 25]
        ]
    }
});

// setTimeout(function () {
//     chart.load({
//         columns: [
//             ['data1', 230, 190, 300, 500, 300, 400]
//         ]
//     });
// }, 1000);

// setTimeout(function () {
//     chart.load({
//         columns: [
//             ['data3', 130, 150, 200, 300, 200, 100]
//         ]
//     });
// }, 1500);

// setTimeout(function () {
//     chart.unload({
//         ids: 'data1'
//     });
// }, 2000);

