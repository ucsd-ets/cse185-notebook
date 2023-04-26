from __future__ import division
from nbgrader.plugins import BasePlugin
import numpy as np

class LatePenalty(BasePlugin):
	def late_submission_penalty(self, student_id, score, total_seconds_late):
	"""Penalty of 5 pts per day late. Cap at 4 days"""
	penalty_per_day = 5
	days_late = np.floor(total_seconds_late/3600/24) # generous grace period
	return min(days_late*penalty_per_day, 4*penalty_per_day)