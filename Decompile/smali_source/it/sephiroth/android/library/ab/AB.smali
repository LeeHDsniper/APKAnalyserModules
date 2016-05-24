.class public Lit/sephiroth/android/library/ab/AB;
.super Ljava/lang/Object;
.source "AB.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lit/sephiroth/android/library/ab/AB$Group;
    }
.end annotation


# static fields
.field private static instance:Lit/sephiroth/android/library/ab/AB;


# instance fields
.field private group:Lit/sephiroth/android/library/ab/AB$Group;

.field private final hashCode:I

.field private final manager:Lit/sephiroth/android/library/ab/ABSettingsFactory$ABSettingsManager;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    invoke-direct {p0, p1}, Lit/sephiroth/android/library/ab/AB;->setup(Landroid/content/Context;)Lit/sephiroth/android/library/ab/ABSettingsFactory$ABSettingsManager;

    move-result-object v0

    iput-object v0, p0, Lit/sephiroth/android/library/ab/AB;->manager:Lit/sephiroth/android/library/ab/ABSettingsFactory$ABSettingsManager;

    .line 34
    iget-object v0, p0, Lit/sephiroth/android/library/ab/AB;->manager:Lit/sephiroth/android/library/ab/ABSettingsFactory$ABSettingsManager;

    invoke-virtual {v0}, Lit/sephiroth/android/library/ab/ABSettingsFactory$ABSettingsManager;->getUUID()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    iput v0, p0, Lit/sephiroth/android/library/ab/AB;->hashCode:I

    .line 40
    return-void
.end method

.method private generateGroup()Lit/sephiroth/android/library/ab/AB$Group;
    .registers 2

    .prologue
    .line 73
    iget v0, p0, Lit/sephiroth/android/library/ab/AB;->hashCode:I

    rem-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_9

    .line 74
    sget-object v0, Lit/sephiroth/android/library/ab/AB$Group;->GroupA:Lit/sephiroth/android/library/ab/AB$Group;

    .line 76
    :goto_8
    return-object v0

    :cond_9
    sget-object v0, Lit/sephiroth/android/library/ab/AB$Group;->GroupB:Lit/sephiroth/android/library/ab/AB$Group;

    goto :goto_8
.end method

.method public static getInstance(Landroid/content/Context;)Lit/sephiroth/android/library/ab/AB;
    .registers 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 90
    sget-object v1, Lit/sephiroth/android/library/ab/AB;->instance:Lit/sephiroth/android/library/ab/AB;

    if-nez v1, :cond_17

    .line 91
    const-class v2, Lit/sephiroth/android/library/ab/AB;

    monitor-enter v2

    .line 92
    :try_start_7
    sget-object v0, Lit/sephiroth/android/library/ab/AB;->instance:Lit/sephiroth/android/library/ab/AB;

    .line 93
    .local v0, "inst":Lit/sephiroth/android/library/ab/AB;
    if-nez v0, :cond_16

    .line 94
    const-class v3, Lit/sephiroth/android/library/ab/AB;

    monitor-enter v3
    :try_end_e
    .catchall {:try_start_7 .. :try_end_e} :catchall_1d

    .line 95
    :try_start_e
    new-instance v1, Lit/sephiroth/android/library/ab/AB;

    invoke-direct {v1, p0}, Lit/sephiroth/android/library/ab/AB;-><init>(Landroid/content/Context;)V

    sput-object v1, Lit/sephiroth/android/library/ab/AB;->instance:Lit/sephiroth/android/library/ab/AB;

    .line 96
    monitor-exit v3
    :try_end_16
    .catchall {:try_start_e .. :try_end_16} :catchall_1a

    .line 98
    :cond_16
    :try_start_16
    monitor-exit v2
    :try_end_17
    .catchall {:try_start_16 .. :try_end_17} :catchall_1d

    .line 100
    .end local v0    # "inst":Lit/sephiroth/android/library/ab/AB;
    :cond_17
    sget-object v1, Lit/sephiroth/android/library/ab/AB;->instance:Lit/sephiroth/android/library/ab/AB;

    return-object v1

    .line 96
    .restart local v0    # "inst":Lit/sephiroth/android/library/ab/AB;
    :catchall_1a
    move-exception v1

    :try_start_1b
    monitor-exit v3
    :try_end_1c
    .catchall {:try_start_1b .. :try_end_1c} :catchall_1a

    :try_start_1c
    throw v1

    .line 98
    .end local v0    # "inst":Lit/sephiroth/android/library/ab/AB;
    :catchall_1d
    move-exception v1

    monitor-exit v2
    :try_end_1f
    .catchall {:try_start_1c .. :try_end_1f} :catchall_1d

    throw v1
.end method

.method private setup(Landroid/content/Context;)Lit/sephiroth/android/library/ab/ABSettingsFactory$ABSettingsManager;
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 81
    invoke-static {p1}, Lit/sephiroth/android/library/ab/ABSettingsFactory;->create(Landroid/content/Context;)Lit/sephiroth/android/library/ab/ABSettingsFactory$ABSettingsManager;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getGroup()Lit/sephiroth/android/library/ab/AB$Group;
    .registers 2

    .prologue
    .line 51
    iget-object v0, p0, Lit/sephiroth/android/library/ab/AB;->group:Lit/sephiroth/android/library/ab/AB$Group;

    if-nez v0, :cond_a

    .line 52
    invoke-direct {p0}, Lit/sephiroth/android/library/ab/AB;->generateGroup()Lit/sephiroth/android/library/ab/AB$Group;

    move-result-object v0

    iput-object v0, p0, Lit/sephiroth/android/library/ab/AB;->group:Lit/sephiroth/android/library/ab/AB$Group;

    .line 54
    :cond_a
    iget-object v0, p0, Lit/sephiroth/android/library/ab/AB;->group:Lit/sephiroth/android/library/ab/AB$Group;

    return-object v0
.end method

.method public getUUID()Ljava/lang/String;
    .registers 2

    .prologue
    .line 43
    iget-object v0, p0, Lit/sephiroth/android/library/ab/AB;->manager:Lit/sephiroth/android/library/ab/ABSettingsFactory$ABSettingsManager;

    invoke-virtual {v0}, Lit/sephiroth/android/library/ab/ABSettingsFactory$ABSettingsManager;->getUUID()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
