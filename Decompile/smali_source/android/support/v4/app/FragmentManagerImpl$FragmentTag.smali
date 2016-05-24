.class Landroid/support/v4/app/FragmentManagerImpl$FragmentTag;
.super Ljava/lang/Object;
.source "FragmentManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/app/FragmentManagerImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "FragmentTag"
.end annotation


# static fields
.field public static final Fragment:[I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 2217
    const/4 v0, 0x3

    new-array v0, v0, [I

    fill-array-data v0, :array_a

    sput-object v0, Landroid/support/v4/app/FragmentManagerImpl$FragmentTag;->Fragment:[I

    return-void

    nop

    :array_a
    .array-data 4
        0x1010003
        0x10100d0
        0x10100d1
    .end array-data
.end method
