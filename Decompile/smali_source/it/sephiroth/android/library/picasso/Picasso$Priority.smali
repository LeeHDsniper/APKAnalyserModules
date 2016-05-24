.class public final enum Lit/sephiroth/android/library/picasso/Picasso$Priority;
.super Ljava/lang/Enum;
.source "Picasso.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/sephiroth/android/library/picasso/Picasso;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Priority"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lit/sephiroth/android/library/picasso/Picasso$Priority;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lit/sephiroth/android/library/picasso/Picasso$Priority;

.field public static final enum HIGH:Lit/sephiroth/android/library/picasso/Picasso$Priority;

.field public static final enum LOW:Lit/sephiroth/android/library/picasso/Picasso$Priority;

.field public static final enum NORMAL:Lit/sephiroth/android/library/picasso/Picasso$Priority;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 97
    new-instance v0, Lit/sephiroth/android/library/picasso/Picasso$Priority;

    const-string v1, "LOW"

    invoke-direct {v0, v1, v2}, Lit/sephiroth/android/library/picasso/Picasso$Priority;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lit/sephiroth/android/library/picasso/Picasso$Priority;->LOW:Lit/sephiroth/android/library/picasso/Picasso$Priority;

    .line 98
    new-instance v0, Lit/sephiroth/android/library/picasso/Picasso$Priority;

    const-string v1, "NORMAL"

    invoke-direct {v0, v1, v3}, Lit/sephiroth/android/library/picasso/Picasso$Priority;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lit/sephiroth/android/library/picasso/Picasso$Priority;->NORMAL:Lit/sephiroth/android/library/picasso/Picasso$Priority;

    .line 99
    new-instance v0, Lit/sephiroth/android/library/picasso/Picasso$Priority;

    const-string v1, "HIGH"

    invoke-direct {v0, v1, v4}, Lit/sephiroth/android/library/picasso/Picasso$Priority;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lit/sephiroth/android/library/picasso/Picasso$Priority;->HIGH:Lit/sephiroth/android/library/picasso/Picasso$Priority;

    .line 96
    const/4 v0, 0x3

    new-array v0, v0, [Lit/sephiroth/android/library/picasso/Picasso$Priority;

    sget-object v1, Lit/sephiroth/android/library/picasso/Picasso$Priority;->LOW:Lit/sephiroth/android/library/picasso/Picasso$Priority;

    aput-object v1, v0, v2

    sget-object v1, Lit/sephiroth/android/library/picasso/Picasso$Priority;->NORMAL:Lit/sephiroth/android/library/picasso/Picasso$Priority;

    aput-object v1, v0, v3

    sget-object v1, Lit/sephiroth/android/library/picasso/Picasso$Priority;->HIGH:Lit/sephiroth/android/library/picasso/Picasso$Priority;

    aput-object v1, v0, v4

    sput-object v0, Lit/sephiroth/android/library/picasso/Picasso$Priority;->$VALUES:[Lit/sephiroth/android/library/picasso/Picasso$Priority;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 96
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lit/sephiroth/android/library/picasso/Picasso$Priority;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 96
    const-class v0, Lit/sephiroth/android/library/picasso/Picasso$Priority;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lit/sephiroth/android/library/picasso/Picasso$Priority;

    return-object v0
.end method

.method public static values()[Lit/sephiroth/android/library/picasso/Picasso$Priority;
    .registers 1

    .prologue
    .line 96
    sget-object v0, Lit/sephiroth/android/library/picasso/Picasso$Priority;->$VALUES:[Lit/sephiroth/android/library/picasso/Picasso$Priority;

    invoke-virtual {v0}, [Lit/sephiroth/android/library/picasso/Picasso$Priority;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lit/sephiroth/android/library/picasso/Picasso$Priority;

    return-object v0
.end method
