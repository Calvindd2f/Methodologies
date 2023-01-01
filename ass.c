modded class DayZPlayerImplement
{
#ifdef SERVER
	protected bool m_PredictedAI = true;

	override void EEKilled(Object killer)
	{
		super.EEKilled(killer);

		if (HasDogtag())
		{
			GetDogtag().OnCarrierKilled(this, killer);
			GetDogtag().SetKilled(IsDogtagTakeable());
		}
	}
#endif

	// ------------------------------------------------------------
	// Attachment locking/unlocking
	// ------------------------------------------------------------

	override bool CanReleaseAttachment(EntityAI attachment)
	{
		if (!super.CanReleaseAttachment(attachment))
			return false;

		if (attachment.IsInherited(Dogtag_Base))
			return GetDogtag().IsKilled();

		return true;
	}

	// ------------------------------------------------------------

	bool HasDogtag()
	{
		return FindAttachmentBySlotName("Dogtag") != null;
	}

	Dogtag_Base GetDogtag()
	{
		return Dogtag_Base.Cast(FindAttachmentBySlotName("Dogtag"));
	}

#ifdef SERVER
	// OBSOLETE
	bool DogtagsTimeRequired()
	{
		Error("Obsolete=DogtagsTimeRequired - use IsDogtagTakeable instead");
		return IsDogtagTakeable();
	}

	bool IsDogtagTakeable()
	{
		if (IsPredictedAI())
			return GetGame().ServerConfigGetInt("dogtagsCanTakeFromAI");

		int time = GetGame().ServerConfigGetInt("dogtagsPlaytimeRequired");
		if (time == -1)
			return false;

		if (StatGet("playtime") < time)
			return false;

		return true;
	}

	bool IsPredictedAI()
	{
		return m_PredictedAI;
	}
#endif
}
