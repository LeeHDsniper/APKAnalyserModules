.class public final enum Lit/sephiroth/android/library/ab/AB$Group;
.super Ljava/lang/Enum;
.source "AB.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/sephiroth/android/library/ab/AB;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Group"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lit/sephiroth/android/library/ab/AB$Group;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lit/sephiroth/android/library/ab/AB$Group;

.field public static final enum GroupA:Lit/sephiroth/android/library/ab/AB$Group;

.field public static final enum GroupB:Lit/sephiroth/android/library/ab/AB$Group;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 11
    new-instance v0, Lit/sephiroth/android/library/ab/AB$Group;

    const-string v1, "GroupA"

    invoke-direct {v0, v1, v2}, Lit/sephiroth/android/library/ab/AB$Group;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lit/sephiroth/android/library/ab/AB$Group;->GroupA:Lit/sephiroth/android/library/ab/AB$Group;

    new-instance v0, Lit/sephiroth/android/library/ab/AB$Group;

    const-string v1, "GroupB"

    invoke-direct {v0, v1, v3}, Lit/sephiroth/android/library/ab/AB$Group;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lit/sephiroth/android/library/ab/AB$Group;->GroupB:Lit/sephiroth/android/library/ab/AB$Group;

    .line 10
    const/4 v0, 0x2

    new-array v0, v0, [Lit/sephiroth/android/library/ab/AB$Group;

    sget-object v1, Lit/sephiroth/android/library/ab/AB$Group;->GroupA:Lit/sephiroth/android/library/ab/AB$Group;

    aput-object v1, v0, v2

    sget-object v1, Lit/sephiroth/android/library/ab/AB$Group;->GroupB:Lit/sephiroth/android/library/ab/AB$Group;

    aput-object v1, v0, v3

    sput-object v0, Lit/sephiroth/android/library/ab/AB$Group;->$VALUES:[Lit/sephiroth/android/library/ab/AB$Group;

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
    .line 10
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lit/sephiroth/android/library/ab/AB$Group;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 10
    const-class v0, Lit/sephiroth/android/library/ab/AB$Group;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lit/sephiroth/android/library/ab/AB$Group;

    return-object v0
.end method

.method public static values()[Lit/sephiroth/android/library/ab/AB$Group;
    .registers 1

    .prologue
    .line 10
    sget-object v0, Lit/sephiroth/android/library/ab/AB$Group;->$VALUES:[Lit/sephiroth/android/library/ab/AB$Group;

    invoke-virtual {v0}, [Lit/sephiroth/android/library/ab/AB$Group;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lit/sephiroth/android/library/ab/AB$Group;

    return-object v0
.end method
