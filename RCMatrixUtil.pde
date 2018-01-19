class RCMatrixUtil {

  RCMatrixUtil () {
  }

  // ######################################################
  // ##                    GENERATE                      ##
  // ######################################################

  public float[][] zeros (int rows, int cols) {

    float[][] resultMatrix = new float[rows][cols];

    for (int c = 0; c < cols; ++c) {
      for (int r = 0; r < rows; ++r) {
        resultMatrix[r][c] = 0.0;
      }
    }

    return resultMatrix;
  }

  public float[][] rand (int rows, int cols) {

    float[][] resultMatrix = new float[rows][cols];

    for (int c = 0; c < cols; ++c) {
      for (int r = 0; r < rows; ++r) {
        resultMatrix[r][c] = random(1);
      }
    }

    return resultMatrix;
  }

  // ######################################################
  // ##                    OPERATIONS                    ##
  // ######################################################

  public float[] add (float[] matrix_a, float[] matrix_b) /*throws Exception*/ {

    int cols_a = this.getCols(matrix_a);
    int cols_b = this.getCols(matrix_b);

    /*
    if (cols_a != cols_b)
     throw new Exception("error in sub()");
     */

    float[] resultMatrix = new float[cols_a];

    for (int c = 0; c < cols_a; ++c) {
      resultMatrix[c] = matrix_a[c] + matrix_b[c];
    }

    return resultMatrix;
  }

  public float[][] add (float[][] matrix, float s) {

    int rows = this.getRows(matrix);
    int cols = this.getCols(matrix);

    float[][] resultMatrix = new float[rows][cols];

    for (int c = 0; c < cols; ++c) {
      for (int r = 0; r < rows; ++r) {
        resultMatrix[r][c] = matrix[r][c] + s;
      }
    }

    return resultMatrix;
  }
  
  public float[][] add (float[][] matrix_a, float[][] matrix_b) {

    int rows = this.getRows(matrix_a);
    int cols = this.getCols(matrix_a);

    float[][] resultMatrix = new float[rows][cols];

    for (int c = 0; c < cols; ++c) {
      for (int r = 0; r < rows; ++r) {
        resultMatrix[r][c] = matrix_a[r][c] + matrix_b[r][c];
      }
    }

    return resultMatrix;
  }

  public float[] sub (float[] matrix_a, float[] matrix_b) /*throws Exception*/ {

    int cols_a = this.getCols(matrix_a);
    int cols_b = this.getCols(matrix_b);

    /*
    if (cols_a != cols_b)
     throw new Exception("error in sub()");
     */

    float[] resultMatrix = new float[cols_a];

    for (int c = 0; c < cols_a; ++c) {
      resultMatrix[c] = matrix_a[c] - matrix_b[c];
    }

    return resultMatrix;
  }

  public float[][] sub (float[][] matrix, float s) {

    int rows = this.getRows(matrix);
    int cols = this.getCols(matrix);

    float[][] resultMatrix = new float[rows][cols];

    for (int c = 0; c < cols; ++c) {
      for (int r = 0; r < rows; ++r) {
        resultMatrix[r][c] = matrix[r][c] - s;
      }
    }

    return resultMatrix;
  }

  public float[][] sub (float s, float[][] matrix) {

    int rows = this.getRows(matrix);
    int cols = this.getCols(matrix);

    float[][] resultMatrix = new float[rows][cols];

    for (int c = 0; c < cols; ++c) {
      for (int r = 0; r < rows; ++r) {
        resultMatrix[r][c] = s - matrix[r][c];
      }
    }

    return resultMatrix;
  }

  public float[][] sub (float[][] matrix_a, float[][] matrix_b) {

    int rows = this.getRows(matrix_a);
    int cols = this.getCols(matrix_a);

    float[][] resultMatrix = new float[rows][cols];

    for (int c = 0; c < cols; ++c) {
      for (int r = 0; r < rows; ++r) {
        resultMatrix[r][c] = matrix_a[r][c] - matrix_b[r][c];
      }
    }

    return resultMatrix;
  }

  public float[] mult (float[] matrix, float m) {

    int cols = this.getCols(matrix);

    float[] resultMatrix = new float[cols];

    for (int c = 0; c < cols; ++c) {
      resultMatrix[c] = matrix[c] * m;
    }

    return resultMatrix;
  }

  public float[][] mult (float[][] matrix, float m) {

    int rows = this.getRows(matrix);
    int cols = this.getCols(matrix);

    float[][] resultMatrix = new float[rows][cols];

    for (int c = 0; c < cols; ++c) {
      for (int r = 0; r < rows; ++r) {
        resultMatrix[r][c] = matrix[r][c] * m;
      }
    }

    return resultMatrix;
  }
  
  public float[][] mult (float[][] matrix_a, float[][] matrix_b) {

    int rows = this.getRows(matrix_a);
    int cols = this.getCols(matrix_a);

    float[][] resultMatrix = new float[rows][cols];

    for (int c = 0; c < cols; ++c) {
      for (int r = 0; r < rows; ++r) {
        resultMatrix[r][c] = matrix_a[r][c] * matrix_b[r][c];
      }
    }

    return resultMatrix;
  }

  public float[][] dot (float[][] matrix_a, float[][] matrix_b) /*throws Exception*/ {

    int rows_a = this.getRows(matrix_a);
    int cols_a = this.getCols(matrix_a);

    int cols_b = this.getCols(matrix_b);

    /*
    if (rows_a != cols_b)
     throw new Exception("error in sub()");
     */

    float[][] resultMatrix = this.zeros(rows_a, cols_b);

    for (int r = 0; r < rows_a; ++r) {
      for (int c = 0; c < cols_a; ++c) {

        for (int i = 0; i < cols_b; ++i) {
          resultMatrix[r][i] += matrix_a[r][c] * matrix_b[c][i];
        }
      }
    }

    return resultMatrix;
  }

  public float sum (float[][] matrix) {

    int rows = this.getRows(matrix);
    int cols = this.getCols(matrix);

    float sum = 0.0;

    for (int c = 0; c < cols; ++c) {
      for (int r = 0; r < rows; ++r) {
        sum += matrix[r][c];
      }
    }

    return sum;
  }


  public float[][] make2d (float[] matrix) {

    int cols = this.getCols(matrix);

    float[][] resultMatrix = new float[cols][1];

    for (int c = 0; c < cols; ++c) {
      resultMatrix[c][0] = matrix[c];
    }

    return resultMatrix;
  }


  public float[][] transpose (float[][] matrix) {

    int rows = this.getRows(matrix);
    int cols = this.getCols(matrix);

    float[][] resultMatrix = new float[cols][rows];

    for (int r = 0; r < rows; ++r) {
      for (int c = 0; c < cols; ++c) {
        resultMatrix[c][r] = matrix[r][c];
      }
    }

    return resultMatrix;
  }


  // ######################################################
  // ##                     HELPER                       ##
  // ######################################################

  public int getCols (float[] matrix) {
    return matrix.length;
  }

  public int getRows (float[][] matrix) {
    return matrix.length;
  }

  public int getCols (float[][] matrix) {
    return matrix[0].length;
  }

  // ######################################################
  // ##                    VISUALIZE                     ##
  // ######################################################

  public void printMatrix (float[][] matrix) {

    int rows = this.getRows(matrix);
    int cols = this.getCols(matrix);

    print("[");

    for (int r = 0; r < rows; ++r) {
      print("[");
      for (int c = 0; c < cols; ++c) {
        print(matrix[r][c]);
        if (c != cols-1)
          print(", ");
      }
      print("]");

      if (r != rows-1)
        println();
      else
        print("]");
    }

    println("\n");
  }
};
