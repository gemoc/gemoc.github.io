import argparse
import os
import xml.etree.ElementTree as ET
from string import Template

def catalogXmiToMd(md_template_path, xmifile_path, mdfile_path):

    if mdfile_path is not None:
            parent_folder = os.path.dirname(mdfile_path)
            if not os.path.exists(parent_folder):
                os.makedirs(parent_folder)
            if os.path.exists(mdfile_path):
                print("Removing previous version of ", mdfile_path)
                os.remove(mdfile_path)
    
    with open(md_template_path, 'r') as file:
        template_content = file.read()
    
    # create element tree object
    tree = ET.parse(xmifile_path)
  
    # get root element
    root = tree.getroot()
    
    sectionTitle =""
    for catalogCategory in root.iter('categories'):
        sectionTitle += "- [{}](#{})\n".format(catalogCategory.get('name'), catalogCategory.get('name').lower().replace(" ","-"))
        #print(catalogCategory.attrib)
    
    sectionContent =""
    for catalogCategory in root.iter('categories'):
        sectionContent += "<hr>\n## {} \n".format(catalogCategory.get('name'))
        sectionContent += "{} \n".format(catalogCategory.get('description'))
        for catalogComponent in catalogCategory.iter('components'):
            sectionContent += '''
<!-- {} -->
<hr>
<div class="row">    
    <div class="col-md-8 col-md-push-4">
        <h3><img src="{}" alt="">
            {}  <small>by {}</small>
        </h3>
        <p>{}</p>\n'''.format(catalogComponent.get('name'),
                              catalogComponent.get('image32'), 
                              catalogComponent.get('name'), 
                              catalogComponent.get('provider'),  
                              catalogComponent.get('description'))   

            for catalogOverview in catalogComponent.iter('overview'):
                sectionContent += '''        <p>{}   
                <a href="{}">Learn more</a></p>\n'''.format(catalogOverview.get('summary'),
                                                  catalogOverview.get('url'))
            sectionContent += '        <p><small>License {}</small></p>\n'.format(catalogComponent.get('license'))
            sectionContent += '''        <h4>Update site</h4>
        <ul style="margin-top:0;">\n'''
            for catalogUpdateSite in catalogComponent.iter('sitesURLS'):
                sectionContent += '''           <li><a href="{}">{}</a></li>\n'''.format(catalogUpdateSite.text,
                                                  catalogUpdateSite.text)
            sectionContent += '''        </ul>\n'''
            for catalogMessage in catalogComponent.iter('messages'):
                icon = "<i class='fa fa-info-circle'></i>"
                if catalogMessage.get('icon') == 'warning' :
                    icon = "<i class='fa fa-warning'></i>"
                sectionContent += '''        <p><b>{} <i>{}</i>:</b> {}</p>\n'''.format(icon,
                              catalogMessage.get('title'),
                              catalogMessage.get('message'))
            sectionContent += '''    </div>\n'''
            for catalogOverview in catalogComponent.iter('overview'):
                if catalogOverview.get('screenshot') :
                    sectionContent += '''    <div class="col-md-4 col-md-pull-8">
        <img class="img-responsive img-hover" src="{}" alt="">        
    </div>\n'''.format(catalogOverview.get('screenshot'))
            
            sectionContent += '''</div>\n'''            
        sectionContent += "\n" 
        
    mdFileContent = Template(template_content)
    mdFileContent = mdFileContent.substitute(SECTION_LIST=sectionTitle, SECTIONS=sectionContent)
    

    if mdfile_path is not None:
        with open(mdfile_path, "w") as file:
            #output_parent_folder = os.path.dirname(mdfile_path)
            #for index in chosen_indexes:            
            #    chosen_file = mp3_files_map[index]
            #    relative_path = os.path.relpath(chosen_file, output_parent_folder)
            file.write(mdFileContent+"\n")
            print(mdfile_path," written")

if __name__ == '__main__':
    # Create an ArgumentParser object
    parser = argparse.ArgumentParser()
    parser.add_argument('folder_name', nargs='?', default='.')
    args = parser.parse_args()
    
    catalogXmiToMd(args.folder_name + "/catalog_template.md", args.folder_name + "/catalog.xmi", args.folder_name + "/catalog.md")
    
