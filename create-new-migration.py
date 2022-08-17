#!/usr/bin/env python3

import os

from typing import List


def get_all_files_recursively() -> List[str]:
    file_names = []
    for path, subdirs, files in os.walk("."):
        for name in files:
            file_names.append(name)
    return file_names


def get_migration_version_from_file_name(filename: str) -> str:
    return filename.split("V")[1].split("__")[0]


def get_all_migration_versions_from_file_names(filenames: list) -> List[int]:
    migration_versions = []
    for filename in filenames:
        migration_version = get_migration_version_from_file_name(filename)
        migration_version_as_int = int(migration_version)
        migration_versions.append(migration_version_as_int)
    return migration_versions


def create_new_migration_file(file):
    with open(file, 'w') as f:
        f.write("")


def get_all_migration_versions():
    existing_migrations = get_all_files_recursively()
    return get_all_migration_versions_from_file_names(existing_migrations)


def calculate_new_migration_version(migration_versions: List[int]):
    last_migration_version = max(migration_versions)
    return last_migration_version + 1


def main():
    migration_versions = get_all_migration_versions()
    new_migration_version = calculate_new_migration_version(migration_versions)
    new_migration_name = input("Migration Name: ")
    new_migration_filename = f"V{new_migration_version}__{new_migration_name}.sql"
    create_new_migration_file(new_migration_filename)


if __name__ == '__main__':
    main()
