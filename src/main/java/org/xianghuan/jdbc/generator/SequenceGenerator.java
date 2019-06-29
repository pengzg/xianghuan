package org.xianghuan.jdbc.generator;

import org.springframework.stereotype.Component;
import org.xianghuan.util.StringUtil;

@Component
public class SequenceGenerator implements IdGenerator {

	public SequenceGenerator() {
		super();
	}

	public String generate() {
		return GuidGenerator.getInstance().nextGuid();
	}

	public String[] generate(String pkcorp, int amount) {
		String[] guids = new String[amount];
		for (int i = 0; i < amount; i++)
			guids[i] = GuidGenerator.getInstance().nextGuid(pkcorp);
		return guids;
	}

	public String[] generate(int amount) {
		String[] guids = new String[amount];
		for (int i = 0; i < amount; i++)
			guids[i] = GuidGenerator.getInstance().nextGuid();
		return guids;

	}

	public String generate(String pkcorp) {
		return GuidGenerator.getInstance().nextGuid(pkcorp);
	}

	
	public String[] generateAndPrefix(String pk_corp, int amount, int width) {
		String[] guids = new String[amount];
		for (int i = 0; i < amount; i++)
			guids[i] = StringUtil.formatLengthPK(pk_corp+GuidGenerator.getInstance().nextGuid(pk_corp),width);
		return guids;
	}

	@Override
	public String[] generateAndPrefix(String pk_corp, int amount) {
		String[] guids = new String[amount];
		for (int i = 0; i < amount; i++)
			guids[i] = StringUtil.formatLengthPK(pk_corp+GuidGenerator.getInstance().nextGuid(pk_corp));
		return guids;
	}

	@Override
	public String[] generateAndPerfix(int amount) {
		String[] guids = new String[amount];
		for (int i = 0; i < amount; i++)
			guids[i] = StringUtil.formatLengthPK(GuidGenerator.getInstance().nextGuid());
		return guids;

	}
}
