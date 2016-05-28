.class public final Lrx/subscriptions/Subscriptions;
.super Ljava/lang/Object;
.source "Subscriptions.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/subscriptions/Subscriptions$1;,
        Lrx/subscriptions/Subscriptions$Unsubscribed;
    }
.end annotation


# static fields
.field private static final UNSUBSCRIBED:Lrx/subscriptions/Subscriptions$Unsubscribed;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 123
    new-instance v0, Lrx/subscriptions/Subscriptions$Unsubscribed;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lrx/subscriptions/Subscriptions$Unsubscribed;-><init>(Lrx/subscriptions/Subscriptions$1;)V

    sput-object v0, Lrx/subscriptions/Subscriptions;->UNSUBSCRIBED:Lrx/subscriptions/Subscriptions$Unsubscribed;

    return-void
.end method

.method public static create(Lrx/functions/Action0;)Lrx/Subscription;
    .registers 2
    .param p0, "unsubscribe"    # Lrx/functions/Action0;

    .prologue
    .line 75
    invoke-static {p0}, Lrx/subscriptions/BooleanSubscription;->create(Lrx/functions/Action0;)Lrx/subscriptions/BooleanSubscription;

    move-result-object v0

    return-object v0
.end method

.method public static empty()Lrx/Subscription;
    .registers 1

    .prologue
    .line 47
    invoke-static {}, Lrx/subscriptions/BooleanSubscription;->create()Lrx/subscriptions/BooleanSubscription;

    move-result-object v0

    return-object v0
.end method

.method public static unsubscribed()Lrx/Subscription;
    .registers 1

    .prologue
    .line 64
    sget-object v0, Lrx/subscriptions/Subscriptions;->UNSUBSCRIBED:Lrx/subscriptions/Subscriptions$Unsubscribed;

    return-object v0
.end method
