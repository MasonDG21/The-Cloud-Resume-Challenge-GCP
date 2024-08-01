```
cloud-resume-challenge/
│
├── frontend/
│   ├── index.html
│   ├── styles.css
│   ├── script.js
│   └── assets/
│       └── images/
│
├── backend/
│   ├── main.py
│   ├── requirements.txt
│   └── tests/
│       └── test_main.py
│
├── infrastructure/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
│
├── .github/
│   └── workflows/
│       ├── frontend-ci-cd.yml
│       └── backend-ci-cd.yml
│
├── docs/
│   └── blog-post.md
│
└── README.md
```

### This structure addresses most of the components in the challenge:
- HTML and CSS (2, 3) are in the frontend directory.
- JavaScript for the visitor counter (7) is in script.js.
- Python code for the API (9, 10) is in the backend directory.
- Tests for Python (11) are in the tests/ subdirectory of backend.
- Terraform for IaC (12) is in the infrastructure directory.
- CI/CD workflows (14, 15) are in the .github/workflows/ directory.
- The blog post (16) can be written in the docs/ directory.

### Components not directly represented in the structure but still part of the challenge:
- Static Website (4), HTTPS (5), DNS (6) - These are configured in Google Cloud and Squarespace.
- Database (8) - This is set up in Google Cloud Firestore.
- Source Control (13) - [GitHub](https://github.com/MasonDG21/The-Cloud-Resume-Challenge-GCP.git)