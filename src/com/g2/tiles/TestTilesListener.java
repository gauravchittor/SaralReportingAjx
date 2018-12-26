package com.g2.tiles;

import org.apache.tiles.TilesApplicationContext;
import org.apache.tiles.factory.AbstractTilesContainerFactory;
import org.apache.tiles.startup.AbstractTilesInitializer;
import org.apache.tiles.startup.TilesInitializer;
import org.apache.tiles.web.startup.AbstractTilesListener;

public class TestTilesListener extends AbstractTilesListener {
	protected TilesInitializer createTilesInitializer() {
		return new TestTilesListenerInitializer(null);
	}

	private static class TestTilesListenerInitializer extends AbstractTilesInitializer {
		public TestTilesListenerInitializer(Object object) {
			// TODO Auto-generated constructor stub
		}

		protected AbstractTilesContainerFactory createContainerFactory(TilesApplicationContext context) {
			return new TestTilesContainerFactory();
		}
		
		
	}
}
