.PHONY: submission
submission:
	@if [ ! -z "$$(git status --porcelain)" ]; \
		then \
			echo 'Uncommitted work found. Did you forget to run `anubis autosave`?'; \
			git status --porcelain; \
			exit; \
		else \
			git diff $$(git rev-list --max-parents=0 HEAD) > submission.patch; \
			zip submission.zip submission.patch; \
	fi

clean:
	rm -f submission.*