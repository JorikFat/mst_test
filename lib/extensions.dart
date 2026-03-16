extension Ext<T> on T {
  R? let<R>(R Function(T) block) => this == null ? null : block(this);
}