"use client";

import React, { useState } from "react";
import WelcomeView from "./welcome-view";
import CreateView from "./create-view";
import ListView from "./list-view";

export default function CalendarPage() {
    // view state: 'welcome' | 'create' | 'list'
    const [currentView, setCurrentView] = useState<'welcome' | 'create' | 'list'>('welcome');

    // This handles the transition between screens
    if (currentView === 'welcome') {
        return (
            <WelcomeView 
                onCreateNew={() => setCurrentView('create')} 
                onViewExisting={() => setCurrentView('list')} 
            />
        );
    }

    if (currentView === 'create') {
        return <CreateView onBack={() => setCurrentView('welcome')} />;
    }

    if (currentView === 'list') {
        return <ListView onBack={() => setCurrentView('welcome')} />;
    }

    return null;
}
