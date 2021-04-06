resource "aws_elasticache_subnet_group" "redis" {
  name       = "redis-cache-subnet"
  subnet_ids = [module.iti.private1_id, module.iti.private2_id]
}

resource "aws_elasticache_cluster" "redis" {
  cluster_id           = "cluster-redis"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis3.2"
  engine_version       = "3.2.10"
  port                 = 6379
  security_group_ids = [aws_security_group.redis.id]
  subnet_group_name = aws_elasticache_subnet_group.redis.name
}