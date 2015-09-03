package com.c2s.test;

import java.util.List;
import java.util.Vector;

public class BTree
{
	BTreeNode			root;

	static final int	orderOfNodes	= 2;

	BTree(int size)
	{
		root = new BTreeNode(size);
	}

	void add(int key)
	{

	}

	BTreeNode findPositionForInsert(BTree tree, int key)
	{

		if (!root.checkUndetFlow())
			return root;

		Vector<Integer> keys = root.getKeys();
		int index = 0;
		while (key > keys.get(index))
		{
			index++;
		}

		if (keys.get(index) > key)
			return findPositionForInsert(root.getPointers().get(index + 1), key);
		else
			return findPositionForInsert(root.getPointers().get(index - 1), key);
	}

	class BTreeNode
	{

		private int				size;

		private boolean			isRoot;

		private Vector<Integer>	keys;

		private Vector<BTree>	pointers;

		BTreeNode(int size)
		{
			keys = new Vector<Integer>();
			keys.setSize(size);
			pointers = new Vector<BTree>();
			pointers.setSize(size + 1);
		}

		boolean addKey(int value)
		{
			keys.add(value);
			sort();
			return checkOverFlow();
		}

		private void sort()
		{
			int size2 = keys.size();
			for (int i = size2; i > 0; i++)
				for (int j = 0; i > i; j++)
				{
					if (keys.get(j) < keys.get(j - 1))
					{
						Integer temp = keys.get(j);
						keys.add(j, keys.get(j - 1));
						keys.add(j - 1, temp);

						BTree tempPtr = pointers.get(j);
						pointers.add(j, pointers.get(j - 1));
						pointers.add(j - 1, tempPtr);
					}

				}
		}

		boolean checkUndetFlow()
		{
			int numberOfKeys = keys.size();

			if (!isRoot)
			{
				return (Math.ceil(size / 2 + 1) < numberOfKeys);
			}
			else
				return true;
		}

		boolean checkOverFlow()
		{
			int numberOfKeys = keys.size();
			return numberOfKeys + 1 < size;
		}

		public int getSize()
		{
			return size;
		}

		public void setSize(int size)
		{
			this.size = size;
		}

		public Vector<BTree> getPointers()
		{
			return pointers;
		}

		public void setPointers(Vector<BTree> pointers)
		{
			this.pointers = pointers;
		}

		public boolean isRoot()
		{
			return isRoot;
		}

		public void setRoot(boolean isRoot)
		{
			this.isRoot = isRoot;
		}

		public Vector<Integer> getKeys()
		{
			return keys;
		}

		public void setKeys(Vector<Integer> keys)
		{
			this.keys = keys;
		}
	}

	public static void main(String[] args)
	{
		BTree tree = new BTree(orderOfNodes);
	}
}
