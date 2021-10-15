import argparse
import json

# Set out table delimiters. We'll use these
# as markers to find the start and end of the table
DELIMTERS = {
    'main': {
        'start': '<!-- Main Settings Start -->',
        'end': '<!-- Main Settings End -->',
    },
}


def extract_table(file='/tmp/issue_body', table='main'):
    """
    Extract the table from the file and return it as a JSON object

    :param file: The file to extract the table from
    :param start: The start of the table
    :param end: The end of the table
    :return: The table as a JSON object
    """
    with open(file, 'r') as f:
        issue = f.read();
    start = issue.find(DELIMTERS[table.lower()]["start"]) + len(DELIMTERS[table.lower()]["start"])
    end = issue.find(DELIMTERS[table.lower()]["end"])
    md_table = issue[start:end]
    return md_table.strip()


def mrkd2json(inp):
    """
    Convert the table to a JSON object. This keeps only the first two columns

    :param inp: The table to convert
    :return: The table as a JSON object
    """
    lines = inp.split('\n')
    settings = {}
    for i,l in enumerate(lines):
        if i < 2: continue
        else:
            settings.setdefault(l.split('|')[1].strip(), l.split('|')[2].strip())
    return json.dumps(settings) 


if __name__ == '__main__':
    # Parse commandline arguments
    parser = argparse.ArgumentParser(description='Convert a Markdown Table to JSON')
    parser.add_argument('--file', '-f', dest='file', default='/tmp/issue_body', help='The file to convert')
    parser.add_argument('--table', '-t', dest='table', default='main', help='The table to parse')
    args = parser.parse_args()
    try:
        print(mrkd2json(extract_table(file=args.file, table=args.table)))
    except Exception as e:
        # Don't fail if we don't have a table, just return an empty JSON object
        print({})