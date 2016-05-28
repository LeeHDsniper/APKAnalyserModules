.class public final Lrx/android/app/AppObservable;
.super Ljava/lang/Object;
.source "AppObservable.java"


# static fields
.field private static final ACTIVITY_VALIDATOR:Lrx/functions/Func1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/functions/Func1",
            "<",
            "Landroid/app/Activity;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static final FRAGMENTV4_VALIDATOR:Lrx/functions/Func1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/functions/Func1",
            "<",
            "Landroid/support/v4/app/Fragment;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static final FRAGMENT_VALIDATOR:Lrx/functions/Func1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/functions/Func1",
            "<",
            "Landroid/app/Fragment;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 29
    new-instance v0, Lrx/android/app/AppObservable$1;

    invoke-direct {v0}, Lrx/android/app/AppObservable$1;-><init>()V

    sput-object v0, Lrx/android/app/AppObservable;->ACTIVITY_VALIDATOR:Lrx/functions/Func1;

    .line 35
    new-instance v0, Lrx/android/app/AppObservable$2;

    invoke-direct {v0}, Lrx/android/app/AppObservable$2;-><init>()V

    sput-object v0, Lrx/android/app/AppObservable;->FRAGMENT_VALIDATOR:Lrx/functions/Func1;

    .line 41
    new-instance v0, Lrx/android/app/AppObservable$3;

    invoke-direct {v0}, Lrx/android/app/AppObservable$3;-><init>()V

    sput-object v0, Lrx/android/app/AppObservable;->FRAGMENTV4_VALIDATOR:Lrx/functions/Func1;

    return-void
.end method

.method public static bindActivity(Landroid/app/Activity;Lrx/Observable;)Lrx/Observable;
    .registers 5
    .param p0, "activity"    # Landroid/app/Activity;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/app/Activity;",
            "Lrx/Observable",
            "<TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 64
    .local p1, "source":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-static {}, Lrx/android/internal/Assertions;->assertUiThread()V

    .line 65
    invoke-static {}, Lrx/android/schedulers/AndroidSchedulers;->mainThread()Lrx/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lrx/Observable;->observeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lrx/android/app/OperatorConditionalBinding;

    sget-object v2, Lrx/android/app/AppObservable;->ACTIVITY_VALIDATOR:Lrx/functions/Func1;

    invoke-direct {v1, p0, v2}, Lrx/android/app/OperatorConditionalBinding;-><init>(Ljava/lang/Object;Lrx/functions/Func1;)V

    invoke-virtual {v0, v1}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static bindSupportFragment(Landroid/support/v4/app/Fragment;Lrx/Observable;)Lrx/Observable;
    .registers 5
    .param p0, "fragment"    # Landroid/support/v4/app/Fragment;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/support/v4/app/Fragment;",
            "Lrx/Observable",
            "<TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 95
    .local p1, "source":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-static {}, Lrx/android/internal/Assertions;->assertUiThread()V

    .line 96
    invoke-static {}, Lrx/android/schedulers/AndroidSchedulers;->mainThread()Lrx/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lrx/Observable;->observeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lrx/android/app/OperatorConditionalBinding;

    sget-object v2, Lrx/android/app/AppObservable;->FRAGMENTV4_VALIDATOR:Lrx/functions/Func1;

    invoke-direct {v1, p0, v2}, Lrx/android/app/OperatorConditionalBinding;-><init>(Ljava/lang/Object;Lrx/functions/Func1;)V

    invoke-virtual {v0, v1}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method
