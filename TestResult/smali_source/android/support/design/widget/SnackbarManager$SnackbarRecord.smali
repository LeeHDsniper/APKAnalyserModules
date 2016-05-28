.class Landroid/support/design/widget/SnackbarManager$SnackbarRecord;
.super Ljava/lang/Object;
.source "SnackbarManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/design/widget/SnackbarManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SnackbarRecord"
.end annotation


# instance fields
.field private final callback:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/support/design/widget/SnackbarManager$Callback;",
            ">;"
        }
    .end annotation
.end field

.field private duration:I


# direct methods
.method static synthetic access$100(Landroid/support/design/widget/SnackbarManager$SnackbarRecord;)I
    .registers 2
    .param p0, "x0"    # Landroid/support/design/widget/SnackbarManager$SnackbarRecord;

    .prologue
    .line 156
    iget v0, p0, Landroid/support/design/widget/SnackbarManager$SnackbarRecord;->duration:I

    return v0
.end method

.method static synthetic access$200(Landroid/support/design/widget/SnackbarManager$SnackbarRecord;)Ljava/lang/ref/WeakReference;
    .registers 2
    .param p0, "x0"    # Landroid/support/design/widget/SnackbarManager$SnackbarRecord;

    .prologue
    .line 156
    iget-object v0, p0, Landroid/support/design/widget/SnackbarManager$SnackbarRecord;->callback:Ljava/lang/ref/WeakReference;

    return-object v0
.end method


# virtual methods
.method isSnackbar(Landroid/support/design/widget/SnackbarManager$Callback;)Z
    .registers 3
    .param p1, "callback"    # Landroid/support/design/widget/SnackbarManager$Callback;

    .prologue
    .line 166
    if-eqz p1, :cond_c

    iget-object v0, p0, Landroid/support/design/widget/SnackbarManager$SnackbarRecord;->callback:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p1, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method
