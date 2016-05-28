.class Landroid/support/v4/os/TraceJellybeanMR2;
.super Ljava/lang/Object;
.source "TraceJellybeanMR2.java"


# direct methods
.method public static beginSection(Ljava/lang/String;)V
    .registers 1
    .param p0, "section"    # Ljava/lang/String;

    .prologue
    .line 20
    invoke-static {p0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 21
    return-void
.end method

.method public static endSection()V
    .registers 0

    .prologue
    .line 24
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 25
    return-void
.end method
