#!/bin/bash

td_agent_version=3
plugins=(
    fluent-plugin-grok-parser
    fluent-plugin-forest
    fluent-plugin-retag
    fluent-plugin-elasticsearch
    fluent-plugin-glusterfs
)

log_dirs_compute=(
    /var/log/libvirt
    /var/log/neutron
    /var/log/nova
    /var/log/openvswitch
)

log_dirs_controller=(
    /var/log/aodh
    /var/log/apache2
    /var/log/ceilometer
    /var/log/chrony
    /var/log/cinder
    /var/log/glance
    /var/log/glusterfs
    /var/log/gnocchi
    /var/log/masakari
    /var/log/mysql
    /var/log/neutron
    /var/log/nova
    /var/log/rabbitmq
)

function install {
    curl https://packages.treasuredata.com/GPG-KEY-td-agent | apt-key add -
    
    # add treasure data repository to apt
    echo "deb http://packages.treasuredata.com/${td_agent_version}/ubuntu/xenial/ xenial contrib" > /etc/apt/sources.list.d/treasure-data.list
    
    # update your sources
    apt-get update
    
    # install the toolbelt
    apt-get install -y td-agent
}

function install_plugins {
    for plugin in ${plugins[@]}; do
        /usr/sbin/td-agent-gem install ${plugin}
    done
}

function update_logs_permission_compute {
    for dir in ${log_dirs_compute[@]}
    do
        chmod og+rx ${dir}
        chmod og+r ${dir}/*
    done
}

function update_logs_permission_controller {
    for dir in ${log_dirs_controller[@]}
    do
        chmod og+rx ${dir}
        chmod og+r ${dir}/*
    done
}
