.class public final enum Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;
.super Ljava/lang/Enum;
.source "Picasso.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/sephiroth/android/library/picasso/Picasso;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "LoadedFrom"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

.field public static final enum DISK:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

.field public static final enum DISK_CACHE:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

.field public static final enum MEMORY:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

.field public static final enum NETWORK:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;


# instance fields
.field final debugColor:I


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 913
    new-instance v0, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    const-string v1, "MEMORY"

    const v2, -0xff0100

    invoke-direct {v0, v1, v3, v2}, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;->MEMORY:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    .line 914
    new-instance v0, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    const-string v1, "DISK"

    const v2, -0xffff01

    invoke-direct {v0, v1, v4, v2}, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;->DISK:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    .line 915
    new-instance v0, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    const-string v1, "NETWORK"

    const/high16 v2, -0x10000

    invoke-direct {v0, v1, v5, v2}, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;->NETWORK:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    .line 916
    new-instance v0, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    const-string v1, "DISK_CACHE"

    const/16 v2, -0x100

    invoke-direct {v0, v1, v6, v2}, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;->DISK_CACHE:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    .line 912
    const/4 v0, 0x4

    new-array v0, v0, [Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    sget-object v1, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;->MEMORY:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    aput-object v1, v0, v3

    sget-object v1, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;->DISK:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    aput-object v1, v0, v4

    sget-object v1, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;->NETWORK:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    aput-object v1, v0, v5

    sget-object v1, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;->DISK_CACHE:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    aput-object v1, v0, v6

    sput-object v0, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;->$VALUES:[Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .registers 4
    .param p3, "debugColor"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .prologue
    .line 920
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 921
    iput p3, p0, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;->debugColor:I

    .line 922
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 912
    const-class v0, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    return-object v0
.end method

.method public static values()[Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;
    .registers 1

    .prologue
    .line 912
    sget-object v0, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;->$VALUES:[Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    invoke-virtual {v0}, [Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    return-object v0
.end method
