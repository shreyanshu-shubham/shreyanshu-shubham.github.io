function load_data_experience(data_array) {
    experience_items = []
    experience_div = document.getElementById('experience_list')

    for (exp in data_array) {
        current_item = data_array[exp]
        let desc = ""
        if(current_item.description.length > 0){
            desc += '<ul class="timeline-text">'
            current_item.description.forEach((element) => {
                desc += '<li>' + element + '</li>'
            });
            desc += '</ul>'
        }        

        experience_element = `<li class="timeline-item"><h4 class="h4 timeline-item-title">${current_item.organization} [${current_item.position}]</h4><span>${current_item.duration}</span>${desc}</li>`;
        
        let div = document.createElement('div');
        div.innerHTML = experience_element;
        experience_div.appendChild(div.firstChild)
    }
}
function load_data_education(data_array) {
    education_items = []
    education_div = document.getElementById('education_list')

    for (exp in data_array) {
        current_item = data_array[exp]

        education_element = `<li class="timeline-item"><h4 class="h4 timeline-item-title">${current_item.institute}</h4><span>${current_item.duration}</span><p class="timeline-text">${current_item.course}</p></li>`;
        
        let div = document.createElement('div');
        div.innerHTML = education_element;
        education_div.appendChild(div.firstChild)
    }
}
function load_data_skill(data_array) {
    skill_items = []
    skill_div = document.getElementById('skill-section')

    for (sub_skill in data_array) {
        current_item = data_array[sub_skill]
        element_string = `<ul class="skills-list content-card"><h3 class="h3 skills-title">${current_item.category}</h3>`
        current_item.items.forEach((element)=>{
            element_string += `<li class="skills-item"><div class="title-wrapper"><h5 class="h5">${element}</h5><!-- <data value="70">70%</data> --></div><div class="skill-progress-bg"><!-- <div class="skill-progress-fill" style="width: 70%;"></div> --></div></li>`;
        })
        element_string += '</ul>'
        let div = document.createElement('div');
        div.innerHTML = element_string;
        skill_div.appendChild(div.firstChild)
        let br = document.createElement('br')
        skill_div.appendChild(br)
    }
}
function load_data_projects(){}
function load_data_awards(data_array){
    cert_type = new Set()
    for(cert in data_array){
        cert_type.add(data_array[cert].type)
    }
    cert_list_filter = document.getElementById('certificates-select-list-filter')
    cert_type.forEach((t)=>{
        element_string = `<li class="filter-item"><button data-filter-btn>${t}</button></li>`
        let div = document.createElement('div')
        div.innerHTML = element_string;
        cert_list_filter.appendChild(div.firstChild)
    })
    cert_list = document.getElementById('certificates-select-list')
    cert_type.forEach((t)=>{
        element_string = `<li class="select-item"><button data-select-item>${t}</button></li>`
        let div = document.createElement('div')
        div.innerHTML = element_string;
        cert_list.appendChild(div.firstChild)
    })
    cert_list_element = document.getElementById('certificates-list')
    cert_image_path = 'assets/certificates/'
    data_array.forEach((cert_item)=>{
        element_string = `<li class="project-item  active" data-filter-item data-category="${cert_item.type}"><a href="${cert_image_path}${cert_item.link[0]}" target="_blank"><figure class="project-img"><div class="project-item-icon-box"><ion-icon name="eye-outline"></ion-icon></div><img src="${cert_image_path}${cert_item.link[0]}" alt="${cert_item.type}" loading="lazy"></figure><h3 class="project-title">${cert_item.title}</h3><p class="project-category">${cert_item.type}</p></a></li>`;
        let div = document.createElement('div');
        div.innerHTML = element_string;
        cert_list_element.appendChild(div.firstChild)
    })
}
fetch('assets/data/user_profile.json')
    .then((res) => res.text())
    .then((text) => {
        user_data = JSON.parse(text)
        load_data_experience(user_data.experiences)
        load_data_education(user_data.education)
        load_data_skill(user_data.skills)

        load_data_awards(user_data.awards)

    })
    .catch((e) => console.error(e));