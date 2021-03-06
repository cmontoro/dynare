/*
 * Copyright (C) 2010 Dynare Team
 *
 * This file is part of Dynare.
 *
 * Dynare is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Dynare is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Dynare.  If not, see <http://www.gnu.org/licenses/>.
 */

#include <algorithm> // For std::min

#include "QRDecomposition.hh"

QRDecomposition::QRDecomposition(size_t rows_arg, size_t cols_arg, size_t cols2_arg) :
  rows(rows_arg), cols(cols_arg), mind(std::min(rows, cols)), cols2(cols2_arg),
  lwork(rows*cols), lwork2(cols2)
{
  work = new double[lwork];
  work2 = new double[lwork2];

  tau = new double[mind];
}

QRDecomposition::~QRDecomposition()
{
  delete[] work;
  delete[] work2;
  delete[] tau;
}
