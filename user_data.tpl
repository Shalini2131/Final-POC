#!/bin/bash
echo ECS_CLUSTER=terraform-ecs-cluster >> /etc/ecs/ecs.config;echo ECS_BACKEND_HOST= >> /etc/ecs/ecs.config;
start ecs